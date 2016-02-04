#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Phones{
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
        * Checking phone in to HLR
        * 
        * param string $phone
        * param string $id Query ID returned if the processing takes longer than 60 seconds
        * return array
        *      option string "phone"
        *      option string "status"
        *      option int "imsi"
        *      option string "network"
        *      option bool "ported"
        *      option string "network_ported"
    ';
    sub check {
        my $self = shift;
        my ($phone, $id, %params) = @_;  
        
        $params{'id'}  = $id;
        $params{'phone'}  = $phone;
        return $self->{parent}->call('phones/check',%params);
    };
    ''//'
        * Validating phone number
        * 
        * param string $phone
        * return array
        *      option bool "correct"
    ';
    sub test {
        my $self = shift;
        my ($phone,%params) = @_;   
        $params{'phone'}  = $phone;
        return $self->{parent}->call('phones/test',%params);
    };
    return 1; 
}