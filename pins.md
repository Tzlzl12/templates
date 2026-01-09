### 1. 引脚对应总览表

| 外设名称          | 类型                  | ID     | STM32 引脚          | 功能描述                          | 颜色（线） | 备注 |
|-------------------|-----------------------|--------|---------------------|-----------------------------------|------------|------|
| **LED**          | wokwi-led (红色)     | led1   | PA7 → A (阳极)<br>GND.1 → C (阴极) | 高电平点亮                       | 绿色 (PA7)<br>黑色 (GND) | 可用于指示灯测试 |
| **Button**       | wokwi-pushbutton (蓝色) | btn1 | PA6 → 2.r<br>GND.1 → 1.l | INPUT_PULLUP，按下低电平         | 绿色 (PA6)<br>黑色 (GND) | 检测按键按下/松开 |
| **MPU6050**      | wokwi-mpu6050        | mpu    | PB8 → SCL<br>PB9 → SDA<br>3V3 → VCC<br>GND.1 → GND | I2C 通信（地址 0x68）<br>可点击模块改 accel 值 | 绿色 (SCL/SDA)<br>红色 (VCC)<br>黑色 (GND) | 加速度/陀螺仪传感器 |
| **OLED 显示屏**  | board-ssd1306        | oled1  | PB8 → SCL<br>PB9 → SDA<br>3V3 → VCC<br>GND.1 → GND | I2C 通信（地址 0x3c）<br>128x64 单色屏 | 绿色 (SCL/SDA)<br>红色 (VCC)<br>黑色 (GND) | 共用 I2C 总线，可显示文字/图形 |
| **Servo 舵机**   | wokwi-servo          | servo1 | PA8 → PWM<br>5V → VCC<br>GND.1 → GND | PWM 信号驱动（50Hz，0-180°）     | 橙色 (PWM)<br>红色 (VCC)<br>黑色 (GND) | 角度动画可见 |
| **Logic Analyzer** | wokwi-logic-analyzer | logic  | PB8 → D0 (SCL)<br>PB9 → D1 (SDA) | 捕获 I2C 波形，用于调试协议     | 绿色 | 运行后下载 .vcd 文件查看 |

### 2. STM32 引脚使用汇总（只列出已连接的）

| STM32 引脚 | 功能       | 连接的外设          | 备注 |
|------------|------------|---------------------|------|
| **PA6**   | GPIO 输入  | Button (2.r)       | INPUT_PULLUP |
| **PA7**   | GPIO 输出  | LED (A)            | 高电平亮 |
| **PA8**   | TIM1_CH1 PWM | Servo (PWM)      | 舵机控制 |
| **PB8**   | I2C1_SCL   | MPU6050 SCL<br>OLED SCL<br>Logic D0 | I2C 时钟线 |
| **PB9**   | I2C1_SDA   | MPU6050 SDA<br>OLED SDA<br>Logic D1 | I2C 数据线 |
| **3V3**   | 电源       | MPU6050 VCC<br>OLED VCC | 3.3V 供电 |
| **5V**    | 电源       | Servo VCC          | 舵机用 5V |
| **GND.1** | 地         | 所有 GND           | 公共地 |