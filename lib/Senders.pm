#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Senders{
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
        * Creating new Sender name
        * 
        * param string $name
        * return array
        *      option bool "success"
    ';
    sub add {
        my $self = shift;
        my ($name, %params) = @_;  
        $params{'name'}  = $name;
        return $self->{parent}->call('senders/add',%params);
    };
    ''//'
        * Senders list
	 * 
	 * param array $params
	 *      option bool "predefined"
         *      option string "sort" Values: name
         *      option string "order" Values: asc|desc
	 * return array
	 *      option array "items"
	 *          option string "name"
	 *          option string "agreement" delivered|required|not_required
	 *          option string "status" pending_authorization|authorized|rejected|deactivated
    ';
    sub index {
        my $self = shift;
        my (%params) = @_;  
        return $self->{parent}->call('senders/index',%params);
    };
    return 1; 
}