# Encryption and Decryption Program 

This assembly program demonstrates a simple encryption and decryption technique for messages entered by the user. It uses the `emu8086.inc` library for 8086 assembly language emulation.

## Program Overview

The program performs the following tasks:

1. **Table Initialization:**
   - Initializes a table with 26 lowercase letters and 26 numbers.

2. **User Input:**
   - Prompts the user to enter a message.

3. **Encryption:**
   - Translates each lowercase letter in the entered message to the corresponding number using the pre-initialized table.
   - Prints the encrypted message.

4. **Decryption:**
   - Translates each number in the encrypted message back to the corresponding lowercase letter using the same table.
   - Prints the decrypted message.

## How to Run

1. **Environment Setup:**
   - Ensure you have an 8086 assembly language emulator installed (e.g., emu8086).

2. **Open the Program:**
   - Open the program in your preferred text editor or IDE.

3. **Run the Program:**
   - Assemble and run the program using the 8086 emulator.

4. **Follow Prompts:**
   - The program will prompt you to enter a message.

5. **View Output:**
   - The encrypted and decrypted messages will be displayed.

## Code Explanation

- **Initialization:**
  - Initializes a table with lowercase letters and numbers.

- **User Input:**
  - Uses the `INT 21h` interrupt to get user input.

- **Encryption:**
  - Translates each lowercase letter to a corresponding number and prints the encrypted message.

- **Decryption:**
  - Translates each number back to the corresponding lowercase letter and prints the decrypted message.

## Notes

- The program assumes lowercase input for simplicity.
- It uses the `XLATB` instruction for translation and the predefined `PRINT_NUM_UNS` function for printing numbers.
- Ensure that the emu8086 emulator is configured to handle 8086 assembly language programs.

