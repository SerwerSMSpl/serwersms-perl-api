#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Groups{
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
        * Add new group
        * 
        * param string $name
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub add {
        my $self = shift;
        my ($name, %params) = @_;
        $params{'name'}   = $name;
        return $self->{parent}->call('groups/add',%params);
    };
    ''//'
        * List of group
        * 
        * param string $search Group name
        * param array $params
        *      option int "page" The number of the displayed page
        *      option int "limit" Limit items are displayed on the single page
        *      option string "sort" Values: name
        *      option string "order" Values: asc|desc
        * return array
        *      option array "paging"
        *          option int "page" The number of current page
        *          option int "count" The number of all pages
        *      option array "items"
        *          option int "id"
        *          option string "name"
        *          option int "count" Number of contacts in the group
    ';
    sub index {
        my $self = shift;
        my ($name, %params) = @_;
        $params{'name'}   = $name;
        return $self->{parent}->call('groups/index',%params);
    };
    ''//'
        * View single group
        * 
        * param int $id
        * return array
        *      option int "id"
        *      option string "name"
        *      option int "count" Number of contacts in the group
    ';
    sub view {
        my $self = shift;
        my ($id, %params) = @_;
        $params{'id'}   = $id;
        return $self->{parent}->call('groups/view',%params);
    };
    ''//'
        * Editing a group
        * 
        * param int $id
        * param string $name
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub edit {
        my $self = shift;
        my ($id,$name, %params) = @_;
        $params{'id'}     = $id;
        $params{'name'}   = $name;
        return $self->{parent}->call('groups/edit',%params);
    };
    ''//'
        * Deleting a group
        * 
        * param int $id
        * return array
        *      option bool "success"
    ';
    sub delete {
        my $self = shift;
        my ($id, %params) = @_;
        $params{'id'}   = $id;
        return $self->{parent}->call('groups/delete',%params);
    };
    ''//'
        * Deleting a group
        * 
        * param int $id
        * return array
        *      option bool "success"
    ';
    sub check {
        my $self = shift;
        my ($phone, %params) = @_;
        $params{'phone'}   = $phone;
        return $self->{parent}->call('groups/check',%params);
    };
    return 1; 
}