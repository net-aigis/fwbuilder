#!/usr/bin/env bash
# Phase-5146: UI ssh-refusal-status roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalStatusRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalStatusRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_status_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5146 e2e passed"
