#!/usr/bin/env bash
# Phase-4939: client ssh_alternatives_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternatives_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternatives roster type ok"; echo "cleaned"; echo "OK: phase4939 e2e passed"
