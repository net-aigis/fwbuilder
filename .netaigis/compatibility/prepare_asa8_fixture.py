#!/usr/bin/env python3
"""Prepare a throwaway ASA 8.0 fixture with interface-subnet network zones.

Never changes checked-in fixtures. This is an explicit derived test fixture,
not a recommendation to deploy the generated policy.
"""
from ipaddress import ip_interface, ip_network
from pathlib import Path
import xml.etree.ElementTree as ET
import sys

def prepare(path: Path) -> list[dict]:
    tree = ET.parse(path)
    root = tree.getroot()
    namespace = root.tag.split("}", 1)[0][1:] if root.tag.startswith("{") else ""
    if namespace:
        ET.register_namespace("", namespace)

    def q(name: str) -> str:
        return f"{{{namespace}}}{name}" if namespace else name

    fw = next((x for x in root.iter(q("Firewall"))
               if x.get("name") == "test_fw" and x.get("version") == "8.0"
               and x.get("platform") == "pix"), None)
    if fw is None:
        raise ValueError("Expected ASA 8.0 test_fw not found")
    networks = {}
    for parent in root.iter():
        for child in parent:
            if child.tag == q("Network"):
                networks[(child.get("address"), child.get("netmask"))] = child
    used_ids = {x.get("id") for x in root.iter() if x.get("id")}
    entries = []
    for iface in fw.findall(q("Interface")):
        ipv4 = iface.find(q("IPv4"))
        if ipv4 is None or not ipv4.get("address") or not ipv4.get("netmask"):
            raise ValueError(f"No IPv4 subnet for {iface.get('name')}")
        net = ip_interface(ipv4.get("address") + "/" + ipv4.get("netmask")).network
        key = (str(net.network_address), str(net.netmask))
        obj = networks.get(key)
        if obj is None:
            container = next((el for el in root.iter(q("ObjectGroup"))
                              if el.get("id") == "stdid03"), None)
            if container is None:
                raise ValueError("Networks container missing")
            obj_id = "netaigis_ci_asa8_zone_" + str(len(entries))
            if obj_id in used_ids:
                raise ValueError("Generated ID collides with existing fixture")
            obj = ET.SubElement(container, q("Network"), {
                "id": obj_id, "name": "CI subnet " + str(net),
                "comment": "Derived from ASA interface address; CI fixture only",
                "ro": "False", "address": key[0], "netmask": key[1]
            })
            networks[key] = obj
            used_ids.add(obj_id)
        iface.set("network_zone", obj.get("id"))
        entries.append({"interface": iface.get("name"), "subnet": str(net),
                        "network_zone": obj.get("id")})
    if len(entries) != 2 or {x["interface"] for x in entries} != {"Ethernet0", "Ethernet1"}:
        raise ValueError("Unexpected ASA 8.0 interface layout")
    # ElementTree drops the external DTD by default; keep it in the CI copy.
    doctype = b'<!DOCTYPE FWObjectDatabase SYSTEM "fwbuilder.dtd">'
    if doctype not in path.read_bytes():
        raise ValueError("Expected FWB XML DTD declaration missing")
    xml = ET.tostring(root, encoding="utf-8", xml_declaration=True)
    if b"?>" not in xml:
        raise ValueError("XML declaration missing from serialized fixture")
    path.write_bytes(xml.replace(b"?>", b"?>\n" + doctype, 1))
    return entries

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: prepare_asa8_fixture.py SCRATCH.fwb")
    print(prepare(Path(sys.argv[1])))
