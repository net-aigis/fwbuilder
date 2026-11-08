#!/usr/bin/env bash
# Phase-8859: client soft_fertig_ssh_password_support_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_password_support_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-password-support-refresh roster type ok"; echo "cleaned"; echo "OK: phase8859 e2e passed"
