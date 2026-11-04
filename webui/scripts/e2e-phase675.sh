#!/usr/bin/env bash
# Phase-675: client SSH note types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh_alternative_notes?' webui/frontend/src/api/client.ts
grep -Fq 'ssh_refusal_path_notes?' webui/frontend/src/api/client.ts
awk '/export function fetchSshAuth/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'alternative_notes'
awk '/export function fetchSshAuth/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'refusal_path_notes'
echo "client ssh notes ok"
echo "cleaned"
echo "OK: phase675 e2e passed"
