#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Files{
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
        * Add new file
        * 
        * param string $type - mms|voice
        * param array $params
        *      option string "url" URL address to file
        *      option resource "file" A file handler (only for MMS)
        * return array
        *      option bool "success"
        *      option string "id"
    ';
    sub add {
        my $self = shift;
        my ($type, %params) = @_;
        $params{'type'}        = $type;
        return $self->{parent}->call('files/add',%params);
    };
    ''//'
        * List of files
        * 
        * param string $type - mms|voice
        * return array
        *      option array "items"
        *          option string "id"
        *          option string "name"
        *          option int "size"
        *          option string "type" - mms|voice
        *          option string "date"
    ';
    sub index {
        my $self = shift;
        my ($type, %params) = @_;
        $params{'type'}        = $type;
        return $self->{parent}->call('files/index',%params);
    };
    ''//'
        * View file
        * 
        * param string $id
        * param string $type - mms|voice
        * return array
        *      option string "id"
        *      option string "name"
        *      option int "size"
        *      option string "type" - mms|voice
        *      option string "date"
    ';
    sub view {
        my $self = shift;
        my ($id,$type, %params) = @_;
        $params{'id'}   = $id;
        $params{'type'} = $type;
        return $self->{parent}->call('files/view',%params);
    };
    ''//'
        * Deleting a file
        * 
        * param string $id
        * param string $type - mms|voice
        * return array
        *      option bool "success"
    ';
    sub delete {
        my $self = shift;
        my ($id,$type, %params) = @_;
        $params{'id'}   = $id;
        $params{'type'} = $type;
        return $self->{parent}->call('files/delete',%params);
    };
    return 1; 
}