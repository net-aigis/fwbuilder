import { useEffect, useMemo, useRef, useState, type ReactNode } from "react";
import type { TreeNode } from "../api/client";

type Props = {
  object?: TreeNode | null;
  readOnly?: boolean;
  busy?: boolean;
  renameFocusToken?: number;
  onSave?: (patch: {
    name: string;
    comment: string;
    attrs: Record<string, string | number>;
  }) => void;
  onOpenRules?: (which: "policy" | "nat" | "routing") => void;
  extras?: ReactNode;
};

const TYPE_FIELDS: Record<string, string[]> = {
  Network: ["address", "netmask"],
  NetworkIPv6: ["address", "netmask"],
  IPv4: ["address", "netmask"],
  IPv6: ["address", "netmask"],
  AddressRange: ["start_address", "end_address"],
  DNSName: ["dnsname", "run_time"],
  AddressTable: ["filename", "run_time"],
  TagService: ["tagcode"],
  UserService: ["userid"],
  CustomService: ["protocol", "address_family", "code"],
  TCPService: ["src_range_start", "src_range_end", "dst_range_start", "dst_range_end"],
  UDPService: ["src_range_start", "src_range_end", "dst_range_start", "dst_range_end"],
  TCPUDPService: ["src_range_start", "src_range_end", "dst_range_start", "dst_range_end"],
  ICMPService: ["type", "code"],
  ICMP6Service: ["type", "code"],
  IPService: ["protocol_num"],
  Firewall: [
    "platform",
    "host_OS",
    "version",
    "lastModified",
    "lastCompiled",
    "lastInstalled",
  ],
  Cluster: [
    "platform",
    "host_OS",
    "version",
    "lastModified",
    "lastCompiled",
    "lastInstalled",
  ],
  Host: ["platform", "host_OS"],
  Interface: [
    "phys_address",
    "label",
    "management",
    "dyn",
    "unnumbered",
    "security_level",
  ],
  Policy: ["top"],
  NAT: ["top"],
  Routing: ["top"],
  Interval: [
    "from_hour",
    "from_minute",
    "to_hour",
    "to_minute",
    "days_of_week",
    "from_day",
    "from_month",
    "from_year",
    "to_day",
    "to_month",
    "to_year",
  ],
};

export function ObjectDetail({
  object,
  readOnly,
  busy,
  renameFocusToken,
  onSave,
  onOpenRules,
  extras,
}: Props) {
  const [name, setName] = useState("");
  const [comment, setComment] = useState("");
  const [attrs, setAttrs] = useState<Record<string, string>>({});
  const nameRef = useRef<HTMLInputElement>(null);

  const fields = useMemo(() => {
    const typed = TYPE_FIELDS[object?.type ?? ""] ?? Object.keys(object?.attrs ?? {});
    return typed.includes("color") ? typed : [...typed, "color"];
  }, [object]);

  useEffect(() => {
    setName(object?.name ?? "");
    setComment(object?.comment ?? "");
    const next: Record<string, string> = {};
    for (const key of fields) {
      const v = object?.attrs?.[key];
      next[key] = v === undefined || v === null ? "" : String(v);
    }
    setAttrs(next);
  }, [object?.id, object?.name, object?.comment, object?.attrs, fields]);

  useEffect(() => {
    if (!renameFocusToken || !object || object.ro || readOnly) return;
    nameRef.current?.focus();
    nameRef.current?.select();
  }, [renameFocusToken, object, readOnly]);

  if (!object) {
    return (
      <div className="panel empty">
        <p>Select an object in the tree.</p>
      </div>
    );
  }

  const locked = Boolean(readOnly || object.ro || !onSave);
  const isFirewall = object.type === "Firewall" || object.type === "Cluster";

  function commit() {
    const out: Record<string, string | number> = {};
    for (const [k, v] of Object.entries(attrs)) {
      if (
        k === "type" ||
        k === "code" ||
        k === "protocol_num" ||
        k === "metric" ||
        k === "security_level" ||
        k === "lastModified" ||
        k === "lastCompiled" ||
        k === "lastInstalled" ||
        k.startsWith("from_") ||
        k.startsWith("to_")
      ) {
        out[k] = v === "" ? 0 : Number(v);
      } else {
        out[k] = v;
      }
    }
    onSave?.({ name, comment, attrs: out });
  }

  function formatAttrValue(key: string, value: string): string {
    if (
      (key === "lastModified" || key === "lastCompiled" || key === "lastInstalled") &&
      value &&
      value !== "0"
    ) {
      const n = Number(value);
      if (Number.isFinite(n) && n > 0) {
        try {
          return `${value} · ${new Date(n * 1000).toISOString()}`;
        } catch {
          return value;
        }
      }
    }
    return value;
  }

  return (
    <div className="panel">
      <header className="panel-header">
        <h2>{object.name || "(unnamed)"}</h2>
        <p className="muted">
          {object.type} · {object.id}
          {object.ro ? " · read-only" : ""}
          {object.deleted ? " · deleted" : ""}
        </p>
        <div className="btn-row">
          <button
            type="button"
            className="ghost"
            disabled={busy}
            onClick={() => {
              void navigator.clipboard?.writeText(object.id).catch(() => {
                window.prompt("Object id", object.id);
              });
            }}
            title="Copy object id"
          >
            Copy id
          </button>
          <button
            type="button"
            className="ghost"
            disabled={busy}
            onClick={() => {
              const text = JSON.stringify(object, null, 2);
              void navigator.clipboard?.writeText(text).catch(() => {
                window.prompt("Object JSON", text);
              });
            }}
            title="Copy object JSON"
          >
            Copy JSON
          </button>
        </div>
      </header>

      {isFirewall && onOpenRules ? (
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => onOpenRules("policy")}>
            Policy
          </button>
          <button type="button" className="ghost" disabled={busy} onClick={() => onOpenRules("nat")}>
            NAT
          </button>
          <button type="button" className="ghost" disabled={busy} onClick={() => onOpenRules("routing")}>
            Routing
          </button>
        </div>
      ) : null}

      <label className="field block">
        Name
        <input
          ref={nameRef}
          value={name}
          disabled={locked || busy}
          onChange={(e) => setName(e.target.value)}
          title="F2 focuses this field"
        />
      </label>
      <label className="field block">
        Comment
        <textarea
          value={comment}
          disabled={locked || busy}
          rows={3}
          onChange={(e) => setComment(e.target.value)}
        />
      </label>

      {fields.length ? (
        <div className="typed-grid">
          {fields.map((key) => {
            const isStamp =
              key === "lastModified" || key === "lastCompiled" || key === "lastInstalled";
            return (
              <label key={key} className="field block">
                {key}
                {isStamp ? (
                  <input
                    value={formatAttrValue(key, attrs[key] ?? "")}
                    disabled
                    readOnly
                  />
                ) : (
                  <input
                    value={attrs[key] ?? ""}
                    disabled={locked || busy}
                    onChange={(e) => setAttrs((prev) => ({ ...prev, [key]: e.target.value }))}
                  />
                )}
              </label>
            );
          })}
        </div>
      ) : (
        <p className="muted">No typed fields for this object type yet.</p>
      )}

      {!locked ? (
        <button type="button" disabled={busy} onClick={commit}>
          Apply object changes
        </button>
      ) : null}

      {extras}
    </div>
  );
}
