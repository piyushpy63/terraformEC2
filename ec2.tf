
resource "aws_key_pair" "sshkey" {

    key_name = "sshkey"
    public_key = file("awssshkey.pub")
}



resource "aws_default_vpc" "vpc1" {

    tags = {
        Name = "default_vpc"        
    }
}



resource "aws_security_group" "sg1" {

    name = "default_sg"
    description = "default security group"
    vpc_id = aws_default_vpc.vpc1.id

    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "ssh allow"
    }

    ingress {

        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "http allow"
        
    }

    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "allow all outbound"
    }

}


resource "aws_instance" "first_instance" {

    key_name = aws_key_pair.sshkey.key_name
    instance_type = "t3.micro"
    security_groups = [ aws_security_group.sg1.name ]
    ami = "ami-0ecb62995f68bb549"    #ubuntu

    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }

    tags = {
        Name = "junoonforaws"
    }

}