#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Premium{
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
        * List of received SMS Premium
        * 
        * return array
        *      option array "items"
        *          option int "id"
        *          option string "to_number" Premium number
        *          option string "from_number" Sender phone number
        *          option string "date"
        *          option int "limit" Limitation the number of responses
        *          option string "text" Message
    ';
    sub index {
        my $self = shift;
        my (%params) = @_;     
        return $self->{parent}->call('premium/index',%params);
    };
    ''//'
        * Sending replies for received SMS Premium
        * 
        * param string $phone
        * param string $text Message
        * param string $gate Premium number
        * param int $id ID received SMS Premium
        * return array
        *      option bool "success"
    ';
    sub send {
        my $self = shift;
        my ($phone, $text, $gate,$id, %params) = @_;  
        
        $params{'id'}    = $id;
        $params{'phone'} = $phone;
        $params{'text'}  = $text;
        $params{'gate'}  = $gate;
        
        return $self->{parent}->call('premium/send',%params);
    };
    ''//'
        * Sending replies for received SMS Premium
        * 
        * param string $phone
        * param string $text Message
        * param string $gate Premium number
        * param int $id ID received SMS Premium
        * return array
        *      option bool "success"
    ';
    sub quiz {
        my $self = shift;
        my ($id, %params) = @_;  
        $params{'id'}    = $id;
        return $self->{parent}->call('quiz/view',%params);
    };
    return 1; 
}