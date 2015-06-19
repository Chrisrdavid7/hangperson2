//
//  main.m
//  week2homework
//
//  Created by Chris David on 6/19/15.
//  Copyright (c) 2015 Chris David. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char phrase[] = "My favorite color is khaki"; //Phase to figure out
        int sizeOfPhrase = sizeof(phrase)/sizeof(char); // array sig
        char alreadyGuessed[22]; // number of characters spaces
        char guess[sizeOfPhrase]; //Phase
        //Array of Guessing
        for (int i = 0; i< sizeOfPhrase-1; i++) {
            if (phrase[i] == ' ') {
                guess[i] = ':';
            }
            else {
                guess[i] = '_';
            }
        }
        printf("Let's Play Hang Person! \n\n");
        //print guess array
        for (int i = 0; i<sizeOfPhrase; i++) {
            if (guess[i] == ':') {
                printf("\t");
            }
            else{
                printf("%c ", guess[i]);
            }
        }
        // number of guesses allowed
        int numberOfGuesses = 7;
        int guessCount = 0;
        while (true) {
            bool guessed = YES; // yes they got it right, no they didnt
            
            for (int i = 0; i<sizeOfPhrase-1; i++) {
                if (guess[i] == '_') {
                    guessed = NO;
                }
            }
            // out of guesses
            if (numberOfGuesses<1) {
                printf("\n\nNope, out of guesses you lost the game");
                break;
            }
            // if they have 0 guess left the answer is no if not automatic yes
            else if (guessed) {
                printf("\n\nTurn Down For WHAT!!!! Let's Go!");
                break;
            }
            else {
                char input;
                bool alreadyInGuessArray = NO;
                bool correctGuess = NO;
                printf("\n\nGuess a letter: ");
                fpurge(stdin);
                scanf("%c", &input);
                
                // to prevent repeated characters
                for (int i = 0; i<26; i++) {
                    if (alreadyGuessed[i] == input) {
                        printf("\nYou already guessed the letter %c \n\n", input);
                        alreadyInGuessArray = YES;
                    }
                }
                // case sensitive array, Thanks Mike.
                if (!alreadyInGuessArray) {
                    alreadyGuessed[guessCount++] = input;
                    for (int i = 0 ; i<sizeOfPhrase; i++) {
                        if (phrase[i] == input || phrase[i] == toupper(input) || phrase[i] == tolower(input)) {
                            correctGuess = YES;
                            guess[i] = phrase[i];
                        }
                    }
                    // If not guess correct
                    if (!correctGuess) {
                        numberOfGuesses--;
                        printf("\nTry Again! %c is not in this phrase \n", input);
                        if(numberOfGuesses==0){
                        }
                        else {
                            printf("You have %d wrong answers left \n \n", numberOfGuesses);
                        }
                        
                    }
                    
                }
                
                for (int i = 0; i<sizeOfPhrase; i++) {
                    if (guess[i] == ':') {
                        printf("\t");
                    }
                    else{
                        printf("%c ", guess[i]);
                    }
                }
            }
        }
    }
    return 0;
}
