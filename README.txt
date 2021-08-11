2021.08.11 Atsushi Noda

このリポジトリに含まれるプログラムの著作権は、野田篤司が持つ
ライセンスは、MITライセンスとする
質問やコメントは、Twitter の @madnoda まで

このリポジトリは、測距センサ VL53L1X を Multiple Zone を活かして使うプログラム例である

コントロール用に使用したマイコンは、STM32F303K8である
使用したマイコンは、自作したものだが、電源と UART i2c しか使っていないので汎用性はあると思う

開発環境は、STM32CubeIDE の2021.08.11時点での最新版 1.7.0

VL53L1X使用 レーザー測距センサモジュール(ToF) は、秋月電子のものを使用
https://akizukidenshi.com/catalog/g/gM-14249/]]
配線は、
V+ を 3.3V
GND を GND
SDA を STM32F303 PB7
SCL を STM32F303 PA15

VL53L1X用のライブラリは、STMicroelectronics社のものを使用したが、再配布は避けた
直接、STMicroelectronics社 のホームページから、ダウンロードしてもらいたい
https://www.st.com/ja/imaging-and-photonics-solutions/vl53l1x.html
の「ツール＆ソフトウエア」タブから
・STSW-IMG007 en.STSW-IMG007_v2.3.3.zip 1.2MB
・X-CUBE-53L1A1 en.X-CUBE-53L1A1_v2.1.0.zip 40MB
の二つをダウンロードする

プロジェクトは、次のように設定した
・STM32CubeIDE(V1.7.0)を使う
・デバイス : STM32F303K8
・プロジェクト名 : STM32F303_VL53L1X
・設定
・システムクロック
　・64MHz
・USART1
　・9600bps
　・PA10 RX
　・PA9 TX
・I2C1
　・I2C:I2C
　・400kbps
　・PA15 SCL
　・PB7 SDA

VL53L1Xライブラリの設定の仕方（GitHubに上げているコードからは消してあるので、必ず行うこと）
・「STM32F303_VL53L1X プロジェクト」の下の「Driversフォルダ」の直下に新たに「VL53L1Xと言うフォルダ」を作る
・en.STSW-IMG007.zip を解凍し、「apiと言うフォルダ」の下にある「core」と「platform」と言う2つのフォルダを、先ほど作った「VL53L1X」の下にドラッグアンドドロップする
・上の2つのフォルダーを強引にincludeパスに追加
　・「Project」メニュー > 「Proterties」
　・開いたダイアログの左側の欄「C/C++ General」「Paths and Symbols」
　　・右側の欄の上のタブ「Inclues」
　　・「Add」ボタンを押し、「File Sytem..」ボタンを押し、前述の2つのフォルダを指定する
・main.c の先頭に「#include "vl53l1_api.h"」を追加して、コンパイルするとコンフリクトが起こるので、
　・「platform」の中の「vl53l1_platform_user_data.h」の「I2C_HandleTypeDef」を「I2C_HandleTypeDefx」に、2箇所、76行目と86行目にあるので置換する
・-X-CUBE-53L1A1(en.X-CUBE-53L1A1.zip)を解凍して出てくる「vl53l1_platform.c」
　・STM32CubeExpansion_53L1A1_V2.1.0/Projects/STM32F401RE-Nucleo/Examples/53L1A1/MultiSensorRanging/Src/vl53l1_platform.c
　・をプロジェクトの「Drivers/VL53L1X/platform/vl53l1_platform.c」に置き換える
　　・「#include "stm32xxx_hal.h"」を#include "stm32f3xx_hal.h"」に置き換える

コンパイルし、ST-LINKなどで、STM32F303に書き込むと UARTに

 138,  82, 109, 190,
  63,  54,  73, 148,
 117, 122, 190, 136,
2089,2105,2401,2455,

のような、4x4の数字が出力される
これが、VL53L1X が測定した対象物までの距離で単位は mm である
VL53L1X は、16x16の合計256の測距センサが2次元状に並んでいる
今回のプログラムでは、16x16 を 4x4 をひとまとめにして、4x4 に分割して使っている
上の数字の並びでは、中央左上に近い物体があったことが判る
プログラムを工夫すれば、4x4以外の どんな組み合わせでも可能だが、私が使った感じでは、2次元の分解能はあまり高くなく、また、細かい分割をすると、測距に時間がかかると言うデメリットもある
