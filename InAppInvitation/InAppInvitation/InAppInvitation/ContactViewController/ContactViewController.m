//
//  ContactViewController.m
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController{
    UIBarButtonItem *selectionBarButtonItem;
    NSMutableOrderedSet *allKeys;
    NSMutableArray<APContact *> *allContacts;
    NSMutableOrderedSet<APContact *> *selectedContact;
    NSMutableDictionary<NSString *, NSArray<APContact *> *> *contactsDictionnary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setup tableview
    [tableViewContact registerNib:[ContactTableViewCell cellNib] forCellReuseIdentifier:[ContactTableViewCell cellIdentifier]];
    
    //setup ui
    [self setupNavigationBarUI];
    
    //load data
    [self loadContacts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Setup UI

-(void)setupNavigationBarUI{
    if (!_contactViewSetting) {
        _contactViewSetting = [ContactViewSetting contactViewDefaultSetting];
    }
    
    //navigation bar
    [self setTitle:_contactViewSetting.title];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :_contactViewSetting.navigationItemsColor}];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:_contactViewSetting.navigationBarColor];
    [[UIApplication sharedApplication] setStatusBarStyle:_contactViewSetting.statusBarStyle animated:YES];
    
    //selection option
    selectionBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Select All" style:UIBarButtonItemStylePlain target:self action:@selector(selectDeselectAllContactWithSender:)];
    [selectionBarButtonItem setTintColor:_contactViewSetting.navigationItemsColor];
    if (_contactViewSetting.showSelectDeselectAllOption) {
        [self.navigationItem setRightBarButtonItem:selectionBarButtonItem];
    }
    
    //bottom bar
    [viewBottomBar setBackgroundColor:_contactViewSetting.bottomBarColor];
    [buttonDone setBackgroundColor:_contactViewSetting.doneButtonBackgroundColor];
    [buttonDone setTitleColor:_contactViewSetting.doneButtonTextColor forState:UIControlStateNormal];
    [buttonCancel setBackgroundColor:_contactViewSetting.cancelButtonBackgroundColor];
    [buttonCancel setTitleColor:_contactViewSetting.cancelButtonTextColor forState:UIControlStateNormal];
}

#pragma mark - Load Contacts

-(void)loadContacts{
    APAddressBook *addressBook = [[APAddressBook alloc] init];
    [addressBook setFieldsMask:(APContactFieldName | APContactFieldPhonesWithLabels | APContactFieldEmailsWithLabels)];
    addressBook.filterBlock = ^BOOL(APContact *contact){
        switch (_contactSubDetailsType) {
            case ContactTableViewCellPhoneNumber:{
                return contact.phones.count > 0;
            }break;
                
            case ContactTableViewCellEmailId:{
                return contact.emails.count > 0;
            }break;
                
            default:
                break;
        }
    };
    [self activityIndicatorVisible:YES];
    [addressBook setSortDescriptors: @[[NSSortDescriptor sortDescriptorWithKey:@"name.firstName" ascending:YES], [NSSortDescriptor sortDescriptorWithKey:@"name.lastName" ascending:YES]]];
    allKeys = [[NSMutableOrderedSet alloc] init];
    selectedContact = [[NSMutableOrderedSet<APContact *> alloc] init];
    contactsDictionnary = [[NSMutableDictionary<NSString *, NSArray<APContact *> *> alloc] init];
    [addressBook loadContacts:^(NSArray<APContact *> * _Nullable contacts, NSError * _Nullable error) {
        allContacts = [[NSMutableArray<APContact *> alloc] initWithArray:contacts];
        [self buildDictionaryForContacts:contacts];
        [self activityIndicatorVisible:NO];
    }];
}

- (void)activityIndicatorVisible:(BOOL)visible{
    [viewBottomBar setHidden:visible];
    [tableViewContact setHidden:visible];
    [viewBottomSperator setHidden:visible];
    [activityIndicatorView setHidden:!visible];
    [selectionBarButtonItem setEnabled:!visible];
}

- (void)buildDictionaryForContacts:(NSArray<APContact *> *)contacts{
    [allKeys removeAllObjects];
    [contactsDictionnary removeAllObjects];
    [contacts enumerateObjectsUsingBlock:^(APContact * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        char key = [obj.name.firstName.capitalizedString characterAtIndex:0];
        if (!(key >= 'A' && key <= 'Z')) {
            key = '#';
        }
        NSMutableArray *keyContacts = [[NSMutableArray alloc] initWithArray:[contactsDictionnary objectForKey:[NSString stringWithFormat:@"%c",key]]];
        [keyContacts addObject:obj];
        [allKeys addObject:[NSString stringWithFormat:@"%c",key]];
        [contactsDictionnary setValue:keyContacts forKey:[NSString stringWithFormat:@"%c",key]];
    }];
    [tableViewContact reloadData];
}

#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return contactsDictionnary.allKeys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contactsDictionnary objectForKey:[allKeys objectAtIndex:section]].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APContact *contact = [[contactsDictionnary objectForKey:[allKeys objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ContactTableViewCell cellIdentifier] forIndexPath:indexPath];
    [cell configCellWithContact:contact andContactSubDetailsType:_contactSubDetailsType andIsSelected:[selectedContact containsObject:contact]];
    return cell;
}


#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    APContact *contact = [[contactsDictionnary objectForKey:[allKeys objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    if ([selectedContact containsObject:contact]) {
        [selectedContact removeObject:contact];
    }else{
        [selectedContact addObject:contact];
    }
    [self updateDoneButtonTitle];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    if (searchBar.isFirstResponder) {
        [searchBar resignFirstResponder];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ContactTableViewCell cellSize];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [allKeys objectAtIndex:section];
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return allKeys.array;
}

- (IBAction)buttonCancelTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonDoneTapped:(UIButton *)sender {
    if (selectedContact.count == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        NSString *body = [NSString stringWithFormat:@"%@\n\n%@",[ShareContent defaultShareContent].message,[ShareContent defaultShareContent].url.absoluteString];
        switch (_contactSubDetailsType) {
            case ContactTableViewCellPhoneNumber:{
                NSMutableArray *contactNumbers = [[NSMutableArray alloc] init];
                [selectedContact enumerateObjectsUsingBlock:^(APContact * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [contactNumbers addObject:obj.phones.firstObject.number];
                }];
                MFMessageComposeViewController *messageViewController = [[MFMessageComposeViewController alloc] init];
                [messageViewController setDelegate:self];
                [messageViewController setMessageComposeDelegate:self];
                [messageViewController setBody:body];
                [messageViewController setRecipients:contactNumbers];
                [self presentViewController:messageViewController animated:YES completion:nil];
            }break;
                
            case ContactTableViewCellEmailId:{
                NSMutableArray *emailAddress = [[NSMutableArray alloc] init];
                [selectedContact enumerateObjectsUsingBlock:^(APContact * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [emailAddress addObject:obj.emails.firstObject.address];
                }];
                MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
                [mailComposeViewController setDelegate:self];
                [mailComposeViewController setMailComposeDelegate:self];
                [mailComposeViewController setSubject:[ShareContent defaultShareContent].subject];
                [mailComposeViewController setToRecipients:emailAddress];
                [mailComposeViewController setMessageBody:body isHTML:NO];
                [self presentViewController:mailComposeViewController animated:YES completion:nil];
            }break;
                
            default:
                break;
        }
    }
}

#pragma mark - MailComposeViewController Delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    _completionHandler((result == MFMailComposeResultSent)?SLComposeViewControllerResultDone:SLComposeViewControllerResultCancelled);
    [controller dismissViewControllerAnimated:YES completion:nil];
    if (result == MFMailComposeResultSent){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    _completionHandler((result == MessageComposeResultSent)?SLComposeViewControllerResultDone:SLComposeViewControllerResultCancelled);
    [controller dismissViewControllerAnimated:YES completion:nil];
    if (result == MessageComposeResultSent){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark - Helper Method

-(void)updateDoneButtonTitle{
    [buttonDone setTitle:((selectedContact.count > 0)?[NSString stringWithFormat:@"Send %@ Invite%@",[NSNumber numberWithInteger: selectedContact.count],(selectedContact.count>1)?@"s":@""]:@"Done") forState:UIControlStateNormal];
    [selectionBarButtonItem setTitle:(allContacts.count == selectedContact.count)?@"Deselect All":@"Select All"];
}

-(void)selectDeselectAllContactWithSender:(UIBarButtonItem *)sender{
    if (allContacts.count == selectedContact.count) {
        [selectedContact removeObjectsInArray:allContacts];
    }else{
        [selectedContact addObjectsFromArray:allContacts];
    }
    [tableViewContact reloadData];
    [self updateDoneButtonTitle];
}


#pragma mark - UISearchBar Delegate

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length) {
        NSArray *filterContacts = [allContacts filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.name.compositeName contains[cd] %@",searchText]];
        [self buildDictionaryForContacts:filterContacts];
    }else{
        [self buildDictionaryForContacts:allContacts];
    }
}

@end
