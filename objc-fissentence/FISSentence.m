//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Bettina on 6/12/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"
@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence


-(void)assembleSentence{
    
    //NSMutableString *mutableSentence = [self.sentence mutableCopy];
    //self.sentence = @"";
    //for (NSUInteger i = 0; i <[self.words count]; i++){
    
    self.sentence =[self.words componentsJoinedByString:@" "];
    
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    
}




-(BOOL)validWord:(NSString *)word{
    
    if([word isEqualToString:@""] || [word isEqualToString:@" "]) {
        return NO;
        //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n are the empty strings being added :%@",self.words);
        
    } else if (word == nil){
        return NO;
        // NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n is nil being added :%@",self.words);
        
    } else{
        return YES;
        //NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n everything else being added:%@",self.words);
    }
}




-(BOOL)validPunctuaton:(NSString *)punctuation{
    //NSString *punctuations =@".?!,;:—";
    //if( [punctuations containsString:punctuation])
    
    NSArray *punctuations = @[@".", @"?", @"!", @",", @";", @":", @"-"];
    
    for( NSString *properPunctuation in punctuations) {
        
        if([punctuation isEqualToString:properPunctuation] && ![punctuation isEqualToString:@""] && punctuation != nil){
            //NSLog(@"\n\n\n\n\n\n\n\n checking punctuation: %@", punctuation);
            return YES;
        }
    }
    return NO;
}



-(BOOL)validIndex:(NSUInteger)index{
    
    // in assessing if a passed-in argument index is out of bounds must account for the "off by one" error between [array count] and index
    if(index + 1 >=[self.words count]) {
        return NO;
        
    } else{
        return YES;
    }
}


-(void)addWord:(NSString *)word{
    //really hard to get conditionals right if method isn't supposed to return anything...how do i go about doing that?
    //    if ([word isEqualToString:@""] || [word isEqualToString:@" "]){
    //        return NO;
    //    }else if (![word isEqual:[NSNull null]]){
    
    BOOL validWord =[self validWord:word];
    
    if(validWord) {
        [self.words addObject:word];
        NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n are the empty strings being added :%@",self.words);
    }
    
    [self assembleSentence];
}




-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    if ([words count] == 0 || words == nil) { //could also do [words isEqual:@[]] to check for empty array.
        
        return;
        
    } else{
        for (NSString* word in words){
            
            BOOL validWord =[self validWord:word];
            
            if (validWord){
                [self.words addObject:word];
                NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n did any words add to array:%@", self.words);
            }
        }
        
        BOOL validPunctuation =[self validPunctuaton:punctuation];
        
        if (validPunctuation){
            NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n Is %@ BEING SWITCHED with punctuation argument %@ IN the sentence: %@", self.punctuation, punctuation, self.sentence);
            
            self.punctuation = punctuation; // affirming that the punctuation argument is correct/valid, therefore we set the punctuation property equal to the punctuation argument so that the self assembleSentence method can/will append (essentially replacing it because set equal) the "correct" punctuation at the end of the sentence. If there was a punctuation already existing in the self.sentence, with this method we are redefining/resetting punctuation property to punctuation argument.
            
            //[self.sentence stringByReplacingOccurrencesOfString:self.punctuation withString:punctuation]; INCORRECT
            //to check if this method is doing what we would like it to do.
        } else{
            return;
        }
    }
    
    
    [self assembleSentence];
}


-(void)removeWordAtIndex:(NSUInteger)index{
    
    BOOL validIndex = [self validIndex:index];
    if(validIndex){
        [self.words removeObjectAtIndex:index];
    }
    
    
    [self assembleSentence];
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    
    BOOL validIndex = [self validIndex:index];
    BOOL validWord =[self validWord:word];
    
    if(validIndex  && validWord) {
        [self.words insertObject:word atIndex:index];
        NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n is word %@ inserting at index:%lu in array %@?", word, index, self.words);
    }
    
    
    [self assembleSentence];
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    
    BOOL validPunctuation =[self validPunctuaton:punctuation];
    if(validPunctuation) {
        self.punctuation = punctuation;
        NSLog(@"is %@ argument replacing _punctuation %@",punctuation,self.punctuation);
    }
    [self assembleSentence];
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
    
    BOOL validIndex = [self validIndex:index];
    BOOL validWord =[self validWord:word];
    
    if(validIndex  && validWord) {
        [self.words replaceObjectAtIndex:index withObject:word];
        
        NSLog(@"is word property %@ replaced at index: %lu by argument %@",self.words, index, word);
    }
    [self assembleSentence];
}



@end
