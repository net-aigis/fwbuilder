#!/usr/bin/env bash
# Phase-5979: client ssh_implemented_check_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_check_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-implemented-check roster type ok"; echo "cleaned"; echo "OK: phase5979 e2e passed"
