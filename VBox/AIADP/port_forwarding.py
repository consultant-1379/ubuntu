from subprocess import call
import sys


def read_ports(file_name):
    result = {}
    with open(file_name) as f:
        for line in f:
            name = line.split('name = ')[1].split(',')[0]
            host_port = line.split('host port = ')[1].split(',')[0]
            # guest_port = line.split('guest port = ')[1].split(',')[0]

            result[name] = host_port
    return result


if len(sys.argv) != 3:
    print('ERROR: correct usage is `python port_forwarding.py <vm_name> <path_to_ports_file>', file=sys.stderr)

vm_name = sys.argv[1]
path_to_ports_file = sys.argv[2]

names_ports = read_ports(path_to_ports_file)
for name, port in names_ports.items():
    command = 'VBoxManage controlvm {} natpf1 {},tcp,127.0.0.1,{},,{}'.format(vm_name, name, port, port)
    print('Executing `{}`'.format(command))
    return_code = call(command, shell=True)
    if return_code == 0:
        print('...done')
