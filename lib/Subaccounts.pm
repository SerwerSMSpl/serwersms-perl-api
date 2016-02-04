#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Subaccounts{
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
        * Creating new subaccount
        * 
        * param string $subaccount_username
        * param string $subaccount_password
        * param int $subaccount_id Subaccount ID, which is template of powers
        * param array $params
        *      option string "name"
        *      option string "phone"
        *      option string "email"
        * return type
    ';
    sub add {
        my $self = shift;
        my ($subaccount_username, $subaccount_password, $subaccount_id,%params) = @_;
        $params{'subaccount_username'}  = $subaccount_username;
        $params{'subaccount_password'}  = $subaccount_password;
        $params{'subaccount_id'}  = $subaccount_id;
        return $self->{parent}->call('subaccounts/add',%params);
    };
    ''//'
        * List of subaccounts
        * 
        * return array
        *      option array "items"
        *          option int "id"
        *          option string "username"
    ';
    sub index {
        my $self = shift;
        my (%params) = @_;
        return $self->{parent}->call('subaccounts/index',%params);
    };
    ''//'
        * View details of subaccount
        * 
        * param int $id
        * return array
        *      option int "id"
        *      option string "username"
        *      option string "name"
        *      option string "phone"
        *      option string "email"
    ';
    sub view {
        my $self = shift;
        my ($id,%params) = @_;
        $params{'id'}  = $id;
        return $self->{parent}->call('subaccounts/view',%params);
    };
    ''//'
        * Setting the limit on subaccount
        * 
        * param int $id
        * param string $type Message type: eco|full|voice|mms|hlr
        * param int $value
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub limit {
        my $self = shift;
        my ($id, $type, $value,%params) = @_;
        $params{'id'}  = $id;
        $params{'type'}  = $type;
        $params{'value'}  = $value;
        return $self->{parent}->call('subaccounts/limit',%params);
    };
    ''//'
        * Deleting a subaccount
        * 
        * param int $id
        * return array
        *      option bool "success"
    ';
    sub delete {
        my $self = shift;
        my ($id,%params) = @_;
        $params{'id'}  = $id;
        return $self->{parent}->call('subaccounts/delete',%params);
    };
    return 1; 
}