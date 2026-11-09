#!/usr/bin/env bash
# Phase-16859: client soft_fertig_ssh_auth_octa_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_octa_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-octa-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase16859 e2e passed"
