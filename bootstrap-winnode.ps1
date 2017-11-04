
# configure hosts file for our internal network defined by Vagrantfile

$hosts = "# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.21  linnode1
10.0.15.22  linnode2
10.0.15.23  linnode3
10.0.15.24  linnode4
10.0.15.25  linnode5
10.0.15.26  linnode6
10.0.15.27  linnode7
10.0.15.28  linnode8
10.0.15.29  linnode9
10.0.15.31  winnode1
10.0.15.32  winnode2
10.0.15.33  winnode3
10.0.15.34  winnode4
10.0.15.35  winnode5
10.0.15.36  winnode6
10.0.15.37  winnode7
10.0.15.38  winnode8
10.0.15.39  winnode9"

Add-Content -Value $hosts -Path "$env:WINDIR\System32\drivers\etc\hosts"