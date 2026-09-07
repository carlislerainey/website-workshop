---
title: "Making All Four of Your Addresses Work"
subtitle: "Namecheap DNS and GitHub Pages"
---

## The Four Addresses

If you are using a custom domain, then four addresses should *all work*. 

- `http://carlislerainey.com`
- `https://carlislerainey.com`
- `http://www.carlislerainey.com`
- `https://www.carlislerainey.com`

Your site may have one or more that does not work.

## Testing

Open the **Terminal** tab in RStudio, replace my domain with yours in the script below, and paste the script into the Terminal.

```
D=carlislerainey.com
for u in http://$D https://$D http://www.$D https://www.$D
do
  printf "%-30s " $u
  curl -s -o /dev/null -m 20 -w "%{http_code} %{redirect_url}\n" $u
done
```

- `200` means the page loaded. 
- `301` means the URL redirected. 
- `000` means the request failed. 

If things work, the output should look like this (3 redirected; one loaded):

```
http://carlislerainey.com        301 https://www.carlislerainey.com/
https://carlislerainey.com       301 https://www.carlislerainey.com/
http://www.carlislerainey.com    301 https://www.carlislerainey.com/
https://www.carlislerainey.com   200
```


## Adding GitHub Pages Records in Namecheap

In Namecheap, go to **Domain List → Manage → Advanced DNS**. 

You need nine records.

| Type | Host | Value |
|---|---|---|
| A Record | `@` | `185.199.108.153` |
| A Record | `@` | `185.199.109.153` |
| A Record | `@` | `185.199.110.153` |
| A Record | `@` | `185.199.111.153` |
| AAAA Record | `@` | `2606:50c0:8000::153` |
| AAAA Record | `@` | `2606:50c0:8001::153` |
| AAAA Record | `@` | `2606:50c0:8002::153` |
| AAAA Record | `@` | `2606:50c0:8003::153` |
| CNAME Record | `www` | `USERNAME.github.io` |


A new Namecheap domain has records already in the list. Delete all of them before you add the records above.

## Adding CNAME

Your repository needs a file named `CNAME` with a single line that contains your domain. In the RStudio console, run this to create the file (replace my domain with yours):

```
writeLines("www.carlislerainey.com", "CNAME")
```

This file belongs in the project root (e.g., alongside `_quarto.yml`). Quarto will copy it into `docs/` each time you render the site. 

Whatever you write in that file is your real address, and GitHub redirects the other form to it. If you write `carlislerainey.com`, then the `www` address redirects to the bare. If you write `www.carlislerainey.com`, then the bare redirects to the www.

## Turning on HTTPS

Render the site, then commit and push in GitHub Desktop.

Go to your website repository on github.com and click **Settings → Pages**. Type your domain into **Custom domain** and click **Save**.

GitHub runs a DNS check. This usually takes a few minutes (but can take up to a day). When it passes, check **Enforce HTTPS**. 
