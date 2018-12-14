clean:
	sudo rm -f /etc/kubernetes/manifests/*
	sudo killall -9  /usr/libexec/crio/conmon pause || echo "not found"
	$(shell ./p_kill)
	sudo rc-service kubelet stop
	sudo su -c 'cat /dev/null > /var/log/kubelet/kubelet.log'
	sudo rc-service crio    stop
	rm -rf certs ~/.kube
	sudo rm -rf /var/lib/etcd  /var/lib/dnsmasq /var/lib/matchbox /var/lib/postgresql/git /var/lib/git  /etc/kubernetes /var/lib/kubernetes/pods /var/lib/containers/storage
