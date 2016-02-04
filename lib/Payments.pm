#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Payments{
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
        * List of payments
        * 
        * return array
        *      option array "items"
        *          option int "id"
        *          option string "number"
        *          option string "state" paid|not_paid
        *          option float "paid"
        *          option float "total"
        *          option string "payment_to"
        *          option string "url"
    ';
    sub index {
        my $self = shift;
        my (%params) = @_;
        return $self->{parent}->call('payments/index',%params);
    };
    ''//'
        * View single payment
        * 
        * param int $id
        * return array
        *      option int "id"
        *      option string "number"
        *      option string "state" paid|not_paid
        *      option float "paid"
        *      option float "total"
        *      option string "payment_to"
        *      option string "url"
    ';
    sub view {
        my $self = shift;
        my ($id, %params) = @_;
        $params{'id'}  = $id;
        return $self->{parent}->call('payments/view',%params);
    };
    ''//'
        * Download invoice as PDF
        * 
        * param int $id
        * return resource
    ';
    sub invoice {
        my $self = shift;
        my ($id, %params) = @_;
        $params{'id'}  = $id;
        return $self->{parent}->call('payments/invoice',%params);
    };
    return 1; 
}