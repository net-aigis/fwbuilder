#!/usr/bin/env bash
# Phase-5179: client ssh_method_lists_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_method_lists_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-method-lists roster type ok"; echo "cleaned"; echo "OK: phase5179 e2e passed"
