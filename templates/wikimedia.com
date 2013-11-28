{% from "helpers/langlist.tmpl" import langlist with context -%}
$TTL 3600
$ORIGIN {{ zonename }}.
@			1D	IN SOA	ns0.wikimedia.org.	hostmaster.wikimedia.org.	(
					{{ serial }}	; serial
					12H		; refresh
					2H		; retry
					2W		; expiry
					1H		; negative cache TTL
					)

; Name servers

			1D	IN NS	ns0.wikimedia.org.
			1D	IN NS	ns1.wikimedia.org.
			1D	IN NS	ns2.wikimedia.org.

; Mail exchangers

                        1H	IN MX   10      mchenry.wikimedia.org.
                        1H	IN MX   50      lists.wikimedia.org.


; Canonical names

                        1H      IN A    208.80.154.224
                        1H      IN AAAA 2620:0:861:ed1a::0

; Servers (alphabetic order)

; Service aliases

; Wikis (alphabetic order)

species                 1H      IN CNAME        wikimedia-lb.wikimedia.org.
www			1H	IN CNAME	wikimedia-lb.wikimedia.org.

; All languages will automatically be included here
{{ langlist('wikimedia-lb.wikimedia.org.') }}

; Other websites
www.donate			1H	IN CNAME	wikimedia-lb.wikimedia.org.
donate			1H	IN CNAME	wikimedia-lb.wikimedia.org.
