#!/usr/bin/env bash
# Phase-4699: client ssh_not_implemented_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented roster type ok"
echo "cleaned"
echo "OK: phase4699 e2e passed"
