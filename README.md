Team members:
Nikita Krasilnikov (responsible for writing code and creating materials for project presentation)

Artem Kostenko (responsible for writing the code, creating the schematic)

Ivan Efimov (responsible for writing the code and testing the project)

Theoretical description and explanation:
This project uses the Nexys A7 FPGA board to implement a hardware-based Caesar Cipher, a simple encryption technique. 
Caesar Cipher Mechanics:
The Caesar Cipher shifts alphabetic characters by a predefined number of positions in the alphabet. This shift can be to the left or right, determined by the encryption key. For decryption, the process is reversed using the same number of shifts in the opposite direction.
![image](https://github.com/Goosis/VHDL-Implementation-of-Basic-Ciphers/assets/167889601/646c539d-db3a-4150-bdcc-d470c87e3ac3)

Project Implementation:
Input Method:
Users input messages using switches on the board, which correspond to different characters displayed on a 7-segment display. Characters are confirmed and navigated through using buttons, which allow users to move to the next or previous character in the message (input mode).
Encryption Setup:
After the message is inputted, the system shifts to encryption mode. Users select the number of positions to shift the characters (the encryption key) and the direction of the shift (left or right) using additional switches.
Output:
The encrypted message is then displayed on the 7-segment display, showing the ciphertext resulting from the applied Caesar Cipher.
This setup effectively demonstrates the encryption and decryption processes, making it an excellent educational tool for understanding both cryptographic and electronic principles in a practical setting.

Schematic of implementation:
![telegram-cloud-photo-size-2-5278283145294242524-y](https://github.com/Goosis/VHDL-Implementation-of-Basic-Ciphers/assets/167889601/51f2dd8e-0ab3-4d93-96bf-700879202b3c)
Description of the main application files:

top_level.vhd

This VHDL file serves as the main module for implementing a Caesar Cipher on the Nexys A7 FPGA board.

Functions:

Input and Reset Control: Manages input through debounced buttons and system reset functionalities.

Cipher Execution: Coordinates encryption processes, handling user inputs via switches for cipher settings (shift direction and magnitude).

Output Display: Controls a 7-segment display to show plaintext and ciphertext, using LEDs for status indication.

Components:

Debounce:Filters button input noise, ensuring clean signals for reliable operation.

Sifr (Cipher):
Encapsulates Caesar Cipher logic, transforming input text based on user settings and displaying the result.

sifr.vhd

Description:
This VHDL file defines the sifr module, which is central to the Caesar Cipher implementation on the Nexys A7 FPGA board. It handles character input, encryption logic, and display output.

Functions:
Character Input Management: Receives character data via switches and manages navigation through input buttons, allowing users to select and confirm characters.
Encryption Logic: Implements the Caesar Cipher by shifting character positions based on user-defined settings for direction and shift magnitude.
Display Control: Manages a 7-segment display to output the encrypted characters, providing a visual representation of both the input and the cipher result.
Components:

driver_7_seg_8_places: Drives the 7-segment display, taking individual character data and converting it into appropriate segments for visual output.
Operation Details:
The module uses button inputs to navigate through characters and initiate encryption. It processes input data to apply the Caesar Cipher and outputs the result on the display.
Resets and initializes display settings and selection variables on a reset command.
Manages selection and encryption states, adjusting display data as characters are encrypted or decrypted.
driver_7_seg_8_places.vhd

Description:
This VHDL file defines the driver_7_seg_8_places module, which is responsible for driving a 7-segment display on the Nexys A7 FPGA board. It manages the display of data across multiple segments simultaneously.

Functions:
Multiplexing Display Outputs: Controls eight separate 7-segment display elements, enabling the display of different data on each segment.
Data Handling: Receives binary inputs and converts them to segment display data.
Reset and Enable Control: Responds to reset signals to clear display data and utilizes an enable signal to manage update timing.

Components:
display_clock: Generates timing signals for updating display data, ensuring that each segment is updated in sequence.
bin_to_symb: Converts binary inputs into 7-segment display symbols.

Operation Details:
The module sequentially selects one of the eight data inputs based on a clock-derived selector signal, converting this data to the corresponding 7-segment code.
It ensures that each segment displays the correct symbol by cycling through all segments rapidly, a process invisible to the human eye but crucial for maintaining continuous display.
The driver_data process manages data selection for conversion and display based on the timing signals generated by the display_clock component. Text display principle used on 7 segment displays: https://en.wikipedia.org/wiki/File:7segment_multiplexing.gif

display_clock.vhd
Description:
This VHDL file implements the display_clock module, designed to generate a controlled 20-bit wide clock signal for timing display updates on FPGA-based systems.

Functions:
Clock Signal Generation: Produces a 20-bit clock used for multiplexing and updating display elements.
Enable Control: Advances the clock only when enabled, ensuring synchronized display updates.
Operation Details:
The module increases a 20-bit counter on each rising edge of the input clock when enabled. The resulting count is outputted as clk_word, used for timing in display-related processes.

bin_to_symb.vhd
Description:
This VHDL file defines the bin_to_symb module, which translates binary inputs into segment patterns for a 7-segment display, integral for displaying characters in FPGA projects.
Functions:
Binary to Symbol Conversion: Converts 5-bit binary inputs into the corresponding 7-segment display patterns.
Segment Output Management: Outputs the calculated 7-segment patterns to display alphanumeric characters and symbols.
Operation Details:
The module listens for binary input (bin_in) and uses a case statement to map each possible input to a predefined 7-segment pattern, stored in the temp signal.
These patterns are then output through seg_data_out to the 7-segment display, allowing for the visual representation of input data.

debounce.vhd
Description:
This VHDL file implements the debounce module, designed to stabilize and detect edges in button input signals using a Finite State Machine (FSM) and edge detection logic. It is optimized for reliable user input handling in FPGA applications.
Functions:
Debouncing: Filters mechanical "bounce" in button signals to produce a stable output.
Edge Detection: Generates signals for rising and falling edges, enabling precise control based on button interactions.
Operation Details:
Operates under a main clock with enable and reset controls, managing transitions through multiple states to confirm button presses and releases.
Outputs include a debounced signal (clean) and edge indicators (pos_edge and neg_edge) for integration into larger systems.

Nexys A7-50T XDC(constraints)
Key Components Configured:
Clock Signal: Establishes the main system clock with a defined IOSTANDARD.
Switches: Sets up the input pin configuration for several user switches with specific IOSTANDARDS.
LEDs: Assigns pins for individual standard and RGB LEDs, configuring their electrical characteristics.
7-Segment Display: Specifies connections for controlling individual segments and digits of the onboard display.
Buttons: Defines the I/O properties for onboard buttons, essential for user interactions.
PMOD Connectors: Assigns the necessary pin configurations for PMOD expansion modules, enhancing the board's connectivity and functionality.
Optional Components: Includes commented-out configurations for additional features such as VGA, USB, Ethernet, and other peripheral interfaces, which can be enabled as per project requirements.

Simulation screenshots of components: tb_debounce
![image](https://github.com/Goosis/VHDL-Implementation-of-Basic-Ciphers/assets/167889601/39cb763c-1df4-4115-bdf1-57ce7aad0353)

tb_bin_to_simb
![image](https://github.com/Goosis/VHDL-Implementation-of-Basic-Ciphers/assets/167889601/41a88ed6-c406-41eb-83c3-1c00660242e8)

Link to a short app video:
https://streamable.com/b6yzmm

https://streamable.com/dkmi30

References
https://github.com/tomas-fryza/vhdl-course/tree/master

https://vhdl.lapinoo.net/testbench/

https://www.wikiwand.com/en/Caesar_cipher

https://en.wikipedia.org/wiki/File:7segment_multiplexing.gif
