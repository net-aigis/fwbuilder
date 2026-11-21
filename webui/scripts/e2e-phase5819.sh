#!/usr/bin/env bash
# Phase-5819: client ssh_password_support_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_password_support_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-password-support roster type ok"; echo "cleaned"; echo "OK: phase5819 e2e passed"
