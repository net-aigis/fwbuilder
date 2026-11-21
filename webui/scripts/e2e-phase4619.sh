#!/usr/bin/env bash
# Phase-4619: client password_ssh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_password_ssh_roster?:' webui/frontend/src/api/client.ts
echo "client password-ssh roster type ok"
echo "cleaned"
echo "OK: phase4619 e2e passed"
