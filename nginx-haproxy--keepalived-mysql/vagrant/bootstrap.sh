# Set up sudo
echo %wheel ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
USER='swenum'
useradd -m "$USER"
mkdir -p /home/"$USER"/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCL9zzr4pPhIi1mp1dkWQdfI4qd0v3TBCjtPmrCG07acbjohai2DRsdloFcsiO53zl9I0uNQYo3DT72yJVcUBw95RXbdi0AR+kCp1HZ61ilrrzyZPsyHSSPDztCPsIxSmKD3K7vU6MB+4JTSsUmp+KiCn9l9X2PvrtPrzPQTEgJbA81hV2aZe5/DrJVTrAZbNY3PzGC52I3E13k5AoMhJsUvyJRYiWcZdgJ37k6fObV0EYRXAOeQWW7qdsVHFwIMu7VsJ22h8ij5aQ33MYjW0jA1l0hsEKk6oyCdV3p98R9V/zUYZXEsHwneBwrn+fs8JJnEPdDVpZuRIK5Pwiy+fg/ vagrant-ssh-otus-12.21" > /home/"$USER"/.ssh/authorized_keys
chown "$USER":"$USER" /home/"$USER" -R
chmod 600 /home/"$USER"/.ssh/authorized_keys
chmod 700 /home/"$USER"/.ssh
usermod -aG wheel "$USER"


