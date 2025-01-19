<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="form-inputs">

                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" placeholder='${msg("email")}'/><div class="required">*</div>
                </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" placeholder='${msg("username")}'/>
                    <div class="required">*</div>
                </div>
            </#if>

                <#if passwordRequired??>
                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                        <input type="password" id="password" class="${properties.kcInputClass!}" name="password" autocomplete="new-password" placeholder='${msg("password")}'/>
                        <div type="button" class="toggle-password" data-target="password">
                            <img class="show-pass" src="${url.resourcesPath}/img/show.svg"/>
                            <img class="hide-pass" src="${url.resourcesPath}/img/hide.svg"/>
                        </div>     
                        <div class="required">*</div>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                        <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" placeholder='${msg("passwordConfirm")}'/>
                        <div type="button" class="toggle-password" data-target="password">
                            <img class="show-pass" src="${url.resourcesPath}/img/show.svg"/>
                            <img class="hide-pass" src="${url.resourcesPath}/img/hide.svg"/>
                        </div>     
                        <div class="required">*</div>
                    </div>

                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                    <input type="checkbox" id="terms" name="terms" required/> I have read and agreed to the site's <a>Privacy Policy</a>
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value='${msg("registerTitle")}'/>
                </div>
            </div>
        </form>
        <div id="kc-login-link" class="${properties.kcFormGroupClass!}">
            <span>Another Method? <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))}</a></span>
        </div>
    </#if>
</@layout.registrationLayout>
