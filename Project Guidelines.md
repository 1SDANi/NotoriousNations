<h1 style="color: hsl(120, 30%, 50%)">Project Guidelines</h1>

<h2 style="color: hsl(120, 30%, 50%)">Naming conventions</h2>


<main style="display: grid; gap: 2rem">
<section style="display: grid; gap: 2rem">
<details open style="color: hsl(120, 40%, 50%); list-style: decimal">
<summary><span style="color: lime">Variable prefix naming conventions</span></summary>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Constants in all caps and underscores between words</li>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Private variables start with <code>_</code></li>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Global variables start with <code>g_</code></li>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Class variables start with no more than four characters</li>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Arrays of variables start with <code>a_</code></li>
</details>

<details open style="color: hsl(120, 40%, 50%); list-style: square">
<summary><span style="color: lime">Where possible use typing for</span></summary>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Return types</li>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Variable types</li>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Parameter types</li>
</details>
</section>

<section style="display: grid; gap: 2rem">
<h3 style="color: lime">Functions</h3>
<h5 style="color: hsl(120, 40%, 50%)">Functions start with the variable prefix naming convention of their return type</h5>

<details open style="color: hsl(120, 40%, 50%); list-style: square">
<summary><span style="color: lime">Functions should be pre-dated by the following comments</span></summary>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">Description of the function</li>
<details style="color: hsl(120, 40%, 50%); padding-left: 2.5rem; list-style: decimal">
<summary>For each parameter</summary>
<li style="padding-left: 2.5rem">The parameter's name followed by a colon</li>
<li style="padding-left: 2.5rem">A space</li>
<li style="padding-left: 2.5rem">A description of that parameter</li>
</details>
<li style="color: hsl(120, 40%, 50%); padding-left: 2.5rem">the string "returns " followed by the return type</li>
</details>
</section>
</main>
