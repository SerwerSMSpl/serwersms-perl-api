#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Stats{
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
        * Statistics an sending
        * 
        * param array $params
        *      option string "type" eco|full|voice|mms
        *      option string "begin" Start date
        *      option string "end" End date
        * return array
        *      option array "items"
        *          option int "id"
        *          option string "name"
        *          option int "delivered"
        *          option int "pending"
        *          option int "undelivered"
        *          option int "unsent"
        *          option string "begin"
        *          option string "end"
        *          option string "text"
        *          option string "type" eco|full|voice|mms
    ';
    sub index {
        my $self = shift;
        my (%params) = @_;
        return $self->{parent}->call('stats/index',%params);
    };
    return 1; 
}