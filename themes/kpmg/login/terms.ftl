<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("termsTitle")}
    <#elseif section = "form">
    <div id="kc-terms-text">
        ${kcSanitize(msg("termsText"))?no_esc}
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">
        <div class="terms-box">
            <div class="terms-text">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="accept" id="kc-accept" type="submit" value="${msg("doAknowledge")}"/>
                     <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" id="kc-decline" type="submit" value="${msg("doDecline")}"/>
            </div>
        </div>
    </form>
    <div class="clearfix"></div>
    </#if>
</@layout.registrationLayout>
