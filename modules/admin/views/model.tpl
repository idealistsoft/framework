{extends file="$moduleViewsDir/parent.tpl"}
{block name=header}
<script type="text/javascript">
	{if isset($modelJSON)}var modelInfo = {$modelJSON};{/if}
	var module = '{$moduleName}';
</script>
{/block}
{block name=main}

	<ul class="nav nav-pills">
		{foreach from=$models item=model}
			<li class="{if !isset($schema) && $model.model == $modelInfo.model}active{/if}">
				<a href="/admin/{$moduleName}/{$model.model}#/">{$model.proper_name_plural}</a>
			</li>
		{/foreach}
		{if $hasSchema}
			<li class="{if isset($schema)}active{/if}">
				<a href="/admin/{$moduleName}/schema">Database Schema</a>
			</li>
		{/if}
	</ul>
	<hr/>

	{block name=content}{/block}
	
	{if isset($schema)}
		
		<p class="lead">
			Infuse Framework will suggest a database schema for your model based on the <a href="https://github.com/jaredtking/infuse/wiki/Models">specified
			properties</a>. On the left is the current schema in your database and on the right is the proposed schema. Click <strong>Update</strong> to
			accept the suggested schema.
		</p>

		{if $success}
			<p class="alert alert-success">The schema was updated!</p>
		{/if}
		{foreach from=$errorStack->messages() item=error}
			<p class="alert alert-error">{$error}</p>
		{/foreach}
		
		{foreach from=$models key=model item=info}
		
			<div class="title-bar">{$info.proper_name}</div>
	
			<div class="row">
				<div class="col-md-6">
					<h3>Current Schema</h3>
	
					{if !$schema[$model].currentSql}
						<pre>{$schema[$model].tablename} does not exist in the database</pre>
					{else}
						<pre>{$schema[$model].currentSql}</pre>
					{/if}
	
				</div>
				<div class="col-md-6">
					<h3>Suggested Schema</h3>
					
					{if !$schema[$model].suggestedSql}
						<pre>No suggestions</pre>
					{else}
						<pre>{$schema[$model].suggestedSql}</pre>
					{/if}
	
					<p>
						{if count($schema[$model].extraFields) > 0}
							<a href="/admin/{$moduleName}/schema/cleanup/{$model}" class="btn btn-large btn-danger pull-right">Delete Old Fields</a>
						{/if}
						{if $schema[$model].different}
							<a href="/admin/{$moduleName}/schema/update/{$model}" class="btn btn-large btn-success">&larr; Update</a>
						{/if}
					</p>
				
				</div>
			</div>
			<br/>
		{/foreach}
	{else}
		<div ng-view></div>
	{/if}
{/block}