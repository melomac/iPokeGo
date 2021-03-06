//
//  GymAnnotationView.m
//  iPokeGo
//
//  Created by Curtis herbert on 8/1/16.
//  Copyright © 2016 Dimitri Dessus. All rights reserved.
//

#import "GymAnnotationView.h"
#import "global.h"

@implementation GymAnnotationView

- (instancetype)initWithAnnotation:(GymAnnotation *)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        self.canShowCallout = YES;
        switch (annotation.teamID) {
            case TEAM_BLUE:
                self.image = [UIImage imageNamed:@"GymMystic"];
                break;
            case TEAM_RED:
                self.image = [UIImage imageNamed:@"GymValor"];
                break;
            case TEAM_YELLOW:
                self.image = [UIImage imageNamed:@"GymInstinct"];
                break;
            default:
                self.image = [UIImage imageNamed:@"GymUnowned"];
                break;
        }
        [self updateForAnnotation:annotation];
    }
    return self;
}

- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    super.annotation = annotation;
    
    [self updateForAnnotation:annotation];
}

- (void)updateForAnnotation:(GymAnnotation *)annotation
{
    GymAnnotation *gym = self.annotation;
    if (gym.guardPokemonID && gym.guardPokemonID != 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"Pokemon_%@", @(gym.guardPokemonID)]]];
        imageView.frame = CGRectMake(0, 0, 45, 45);
        self.leftCalloutAccessoryView = imageView;
        
    } else {
        self.leftCalloutAccessoryView = nil;
    }
}

@end
