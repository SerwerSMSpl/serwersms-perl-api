#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Blacklist{
    use strict;
    use warnings;
    
    my $serwersms;
    sub new{
       
        my $class = shift;
        my $self = { @_ };
        $serwersms = $self->{parent}; 
        bless $self, $class;
        return $self;
    };
    ''//'
        * Add phone to the blacklist
        * 
        * param string $phone
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub add {
        my $self = shift;
        my ($phone,%params) = @_;
        $params{'phone'}  = $phone;
        return $self->{parent}->call('blacklist/add',%params);
    };
    ''//'
        * List of blacklist phones
        * 
        * param string $phone
        * param array $params
        *      option int "page" The number of the displayed page
        *      option int "limit" Limit items are displayed on the single page
        * return array
        *      option array "paging"
        *          option int "page" The number of current page
        *          option int "count" The number of all pages
        *      option array "items"
        *          option string "phone"
        *          option string "added" Date of adding phone
    ';
    sub index {
        my $self = shift;
        my ($phone,%params) = @_;
        $params{'phone'}  = $phone;
        return $self->{parent}->call('blacklist/index',%params);
    };
    ''//'
        * Checking if phone is blacklisted
        * 
        * param string $phone
        * return array
        *      option bool "exists"
    ';
    sub check {
        my $self = shift;
        my ($phone,%params) = @_;
        $params{'phone'}  = $phone;
        return $self->{parent}->call('blacklist/check',%params);
    };
    ''//'
        * Deleting phone from the blacklist
        * 
        * param string $phone
        * return array
        *      option bool "success"
    ';
    sub delete {
        my $self = shift;
        my ($phone,%params) = @_;
        $params{'phone'}  = $phone;
        return $self->{parent}->call('blacklist/delete',%params);
    };
    return 1; 
}