//
//	LTPToyChooserViewController.m
//	LTPlayground
//
//	Copyright (c) 2012 Michael Potter
//	http://lucas.tiz.ma
//	lucas@tiz.ma
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "LTPToyChooserViewController.h"

@implementation LTPToyChooserViewController

#pragma mark - UIViewController Methods

- (void)viewDidLoad
{
	[super viewDidLoad];

	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
	{
		self.clearsSelectionOnViewWillAppear = NO;
	}
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	if (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) && ([self.tableView indexPathForSelectedRow] == nil))
	{
		NSIndexPath *firstCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];

		[self tableView:self.tableView didSelectRowAtIndexPath:firstCellIndexPath];
		[self.tableView selectRowAtIndexPath:firstCellIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? (interfaceOrientation == UIInterfaceOrientationPortrait) : YES);
}

#pragma mark - Protocol Implementations

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
	{
		UITableViewCell *selectedTableViewCell = [self.tableView cellForRowAtIndexPath:indexPath];
		UIViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:selectedTableViewCell.textLabel.text];

		UINavigationController *detailNavigationController = [self.splitViewController.viewControllers lastObject];
		detailNavigationController.viewControllers = [NSArray arrayWithObject:nextViewController];
	}
}

#pragma mark - UISplitViewControllerDelegate Methods

- (BOOL)splitViewController:(UISplitViewController *)splitViewController shouldHideViewController:(UIViewController *)viewController
	inOrientation:(UIInterfaceOrientation)orientation
{
	return NO;
}

@end