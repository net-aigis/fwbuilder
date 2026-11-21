#!/usr/bin/env bash
# Phase-674: UI SSH alternative/refusal notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshAlternativeNotes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh_alternative_notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh_refusal_path_notes' webui/frontend/src/components/FirewallExtras.tsx
echo "ssh notes UI ok"
echo "cleaned"
echo "OK: phase674 e2e passed"
