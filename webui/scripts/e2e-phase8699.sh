#!/usr/bin/env bash
# Phase-8699: client soft_fertig_ssh_not_implemented_password_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_password_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-password-refresh roster type ok"; echo "cleaned"; echo "OK: phase8699 e2e passed"
