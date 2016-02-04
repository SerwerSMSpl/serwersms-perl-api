#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Account{
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
        * 
        * param array $params
        *      option string "phone"
        *      option string "email"
        *      option string "first_name"
        *      option string "last_name"
        *      option string "company"
        * return array
        *      option bool "success"
    ';
    sub add {
        my $self = shift;
        my (%params) = @_;     
        return $self->{parent}->call('account/add',%params);
    };
    ''//'
        * Return limits SMS
        * 
        * return array
        *      option array "items"
        *          option string "type" Type of message
        *          option string "chars_limit" The maximum length of message
        *          option string "value" Limit messages
        * 
    ';
    sub limits {
        my $self = shift;
        my (%params) = @_;
        return $self->{parent}->call('account/limits',%params);
    };
    ''//'
        * Return contact details
        * 
        * return array
        *      option string "telephone"
        *      option string "email"
        *      option string "form"
        *      option string "faq"
        *      option array "quardian_account"
        *          option string "name"
        *          option string "email"
        *          option string "telephone"
        *          option string "photo"
    ';
    sub help {
        my $self = shift;
        my (%params) = @_;    
        return $self->{parent}->call('account/help',%params);
    };
    ''//'
        * Return messages from the administrator
        * 
        * return array
        *      option bool "new" Marking unread message
        *      option string "message" 
    ';
    sub messages {
        my $self = shift;
        my (%params) = @_;    
        return $self->{parent}->call('account/messages',%params);
    };
    return 1; 
}