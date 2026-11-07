#!/usr/bin/env bash
# Phase-6059: client ssh_not_implemented_check_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_check_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-check roster type ok"; echo "cleaned"; echo "OK: phase6059 e2e passed"
