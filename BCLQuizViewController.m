//
//  BCLQuizViewController.m
//  Quiz
//
//  Created by Sujin Park on 4/26/14.
//  Copyright (c) 2014 Boredcatlady. All rights reserved.
//

#import "BCLQuizViewController.h"

@interface BCLQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BCLQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    // Return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    
    // Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Display the question label
    self.questionLabel.text = self.questions[self.currentQuestionIndex];
    
    // Reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer;
    
    if ([self.questionLabel.text length] == 0) {
        // Show nothing is questions is blank
        answer = @"You can't have an answer without a question first!";
    }
    else {
        // What is the answer to the current question?
        answer = self.answers[self.currentQuestionIndex];
    }
    
    // Display it in the answer label
    self.answerLabel.text = answer;
}

@end
