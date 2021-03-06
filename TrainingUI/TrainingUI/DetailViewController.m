//
//  DetailViewController.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "DetailViewController.h"
#import "RemoveItemService.h"

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self updateViews];

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteItem)];
}

- (void)deleteItem {
	RemoveItemService *service = [[RemoveItemService alloc] init];

	[self showLoadingMessage:@"Cargando"];
	[service removeItem:self.item callbackBlock: ^(RemoveItemService *service) {
	    [self hideLoadingMessage];
	}];
}

- (void)updateViews {
	self.titleLabel.text = self.item.title;
	self.descriptionLabel.text = self.item.itemDescription;
	self.imageView.image = [UIImage imageNamed:self.item.imageName];
}

@end
