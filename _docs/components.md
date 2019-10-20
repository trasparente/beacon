---
---

# Components

* toc
{:toc}

## Scaffolding

By default page content is rendered inside a `<!--section--><!--column-->` tag.  
To add a new section use `<!--section-->` and to add additional columns use `<!--column-->`.

**Sections example**

Sections can be styled by adding an ordered array of colors `css.bg.sections` in the `config` file and choose the section class with `<!--sectionX-->` where `X` is the index of the element in the array.

```yml
# _config file
css:
  bg:
    sections:
      - LightCyan
      - OldLace
```

```html
<!--section1-->

Lorem ...

<!--section2-->

Lorem ...

<!--section-->
```

<!--section1-->

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<!--section2-->

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<!--section-->

**Grid example**

```html
<!--section-->

Lorem ...

<!--column-->

Lorem ...
```

<!--section-->

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<!--column-->

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<!--section-->

## Modals

Via liquid

```liquid
{% raw %}{% include components/modal.html page="page/modals/info.html" id="myModal" %}{% endraw %}
```

```html
<a href="#myModal">Modal link</a>
```

{% include components/modal.html page="page/modals/info.html" id="myModal" %}
<a href="#myModal">Modal link</a>

Via javascript

```html
<a href="#modalAlert" onclick="modal_alert('Example', 'danger')">Modal link<a/>
```

```cs
modal_alert "Example", "danger"
```

<a href="#modalAlert" onclick="modal_alert('Example', 'danger')">Modal link<a/>

## Markdown

### Headers

```md
# 1 Header
## 2 Header
### 3 Header
#### 4 Header
##### 5 Header
```

# 1 Header
{:.no_toc}
## 2 Header
{:.no_toc}
### 3 Header
{:.no_toc}
#### 4 Header
{:.no_toc}
##### 5 Header
{:.no_toc}

**Text styles**

```md
- `code`
- *oblique*
- **Bold**
```

- `code`
- *oblique*
- **Bold**

**Horizontal line**

```md
---
```

---

**Blockquote**

```
> Lorem ...
```

> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

**Code block**

<pre class="highlight"><code>```yml
example: 1
```</code></pre>

```yml
example: 1
```

## Alerts

```liquid
{% raw %}{% include components/blockquote.html body="Example" class="info" %}{% endraw %}
```

{% include components/blockquote.html body="Example" class="warning" %}