{extends file='page.tpl'}

{block name="header"}
    <script src="{"js/app/studs.js"|resource}" type="text/javascript"></script>
{/block}

{block name=main}

    <div id="message-container">
        {if !empty($message)}
            <div class="alert alert-dismissible alert-{$message->type|html}" role="alert">{$message->message|html}<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
        {/if}
    </div>

{* Global informations about the current poll *}

{include 'part/poll_info.tpl' admin=$admin}

{* Information about voting *}
{if $expired}
    <div class="alert alert-danger">
        <p>{__('studs\\The poll is expired, it will be deleted soon.')}</p>
        <p>{__('studs\\Deletion date:')} {$deletion_date|date_format:$date_format['txt_short']|html}</p>
    </div>
{else}
    {if $admin}
        {include 'part/poll_hint_admin.tpl'}
    {else}
        {include 'part/poll_hint.tpl' active=$poll->active}
    {/if}
{/if}

{* Scroll left and right *}

<div class="hidden row scroll-buttons" aria-hidden="true">
    <div class="btn-group pull-right">
        <button class="btn btn-sm btn-link scroll-left" title="{__('Poll results\\Scroll to the left')}">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </button>
        <button class="btn  btn-sm btn-link scroll-right" title="{__('Poll results\\Scroll to the right')}">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </button>
    </div>
</div>

<div class="hidden">
    <p id="parameter_name_regex">{$parameter_name_regex}</p>
    <p id="parameter_name_error">{__('Error','Name is incorrect.')|var_dump}</p>
</div>


{* Vote table *}

{if $poll->format === 'D'}
    {include 'part/vote_table_date.tpl' active=$poll->active}
{else}
    {include 'part/vote_table_classic.tpl' active=$poll->active}
{/if}

{* Comments *}

{include 'part/comments.tpl' active=$poll->active comments=$comments}

{/block}