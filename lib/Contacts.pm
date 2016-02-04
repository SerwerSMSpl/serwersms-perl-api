#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Contacts{
    use strict;
    use warnings;
    use JSON::XS;
    
    my $serwersms;
    sub new{
       
        my $class = shift;
        my $self = { @_ }; 
        $serwersms = $self->{parent}; 
        bless $self, $class;
        return $self;
    };
    ''//'
        * Add new contact
        * 
        * param string $group_id
        * param string $phone
        * param array $params
        *      option string "email"
        *      option string "first_name"
        *      option string "last_name"
        *      option string "company"
        *      option string "tax_id"
        *      option string "address"
        *      option string "city"
        *      option string "description"
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub add {
        my $self = shift;
        my ($group_id,$phone, %params) = @_;
        $params{'phone'}     = $phone;
        $params{'group_id'}  = $group_id;
        return $self->{parent}->call('contacts/add',%params);
    };
    ''//'
        * List of contacts
        * 
        * param int $group_id
        * param string $search
        * param array $params
        *      option int "page" The number of the displayed page
        *      option int "limit" Limit items are displayed on the single page
        *      option string "sort" Values: first_name|last_name|phone|company|tax_id|email|address|city|description
        *      option string "order" Values: asc|desc
        * return array
        *      option array "paging"
        *          option int "page" The number of current page
        *          option int "count" The number of all pages
        *      options array "items"
        *          option int "id"
        *          option string "phone"
        *          option string "email"
        *          option string "company"
        *          option string "first_name"
        *          option string "last_name"
        *          option string "tax_id"
        *          option string "address"
        *          option string "city"
        *          option string "description"
        *          option bool "blacklist"
        *          option int "group_id"
        *          option string "group_name"
    ';
    sub index {
        my $self = shift;
        my ($group_id,$search, %params) = @_;
        $params{'search'}     = $search;
        $params{'group_id'}  = $group_id;
        return $self->{parent}->call('contacts/index',%params);
    };
    ''//'
        * View single contact
        * 
        * param int $id
        * return array
        *      option integer "id"
        *      option string "phone"
        *      option string "email"
        *      option string "company"
        *      option string "first_name"
        *      option string "last_name"
        *      option string "tax_id"
        *      option string "address"
        *      option string "city"
        *      option string "description"
        *      option bool "blacklist"
    ';
    sub view {
        my $self = shift;
        my ($id, %params) = @_;
        $params{'id'}     = $id;
        return $self->{parent}->call('contacts/view',%params);
    };
    ''//'
        * Editing a contact
        * 
        * param int $id
        * param int $group_id
        * param string $phone
        * param array $params
        *      option string "email"
        *      option string "first_name"
        *      option string "last_name"
        *      option string "company"
        *      option string "tax_id"
        *      option string "address"
        *      option string "city"
        *      option string "description"
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub edit {
        my $self = shift;
        my ($id,$group_id, $phone, %params) = @_;
        $params{'id'}        = $id;
        $params{'group_id'}  = $group_id;
        $params{'phone'}     = $phone;
        return $self->{parent}->call('contacts/edit',%params);
    };
    ''//'
        * Deleting a phone from contacts
        * 
        * param int $id
        * return array
        *      option bool "success"
    ';
    sub delete {
        my $self = shift;
        my ($id,%params) = @_;
        $params{'id'}    = $id;
        return $self->{parent}->call('contacts/delete',%params);
    };
    ''//'
        * Import contact list
        * 
        * param string $group_name
        * param array $contact[]
        *      option string "phone"
        *      option string "email"
        *      option string "first_name"
        *      option string "last_name"
        *      option string "company"
        * return array
        *      option bool "success"
        *      option int "id"
        *      option int "correct" Number of contacts imported correctly
        *      option int "failed" Number of errors
    ';
    sub imports {
        my $self = shift;
        my ($group_name,$contacts) = @_;
        
        my %params = ();
        $params{'contact'} = $contacts;
        $params{'group_name'} = $group_name;
        return $self->{parent}->call('contacts/import',%params);
    };
    return 1; 
}