#!/usr/bin/env bash
# Phase-6779: client ssh_not_implemented_password_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_password_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-password roster type ok"; echo "cleaned"; echo "OK: phase6779 e2e passed"
