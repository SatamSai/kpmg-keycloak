<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section == "header">
        <div class="heading">
            <img src="${url.resourcesPath}/img/magda_logo.svg" class="logo-img"/>
            <div>Get Started <i>Now</i></div>
        </div>
    <#elseif section == "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="form-inputs" id="step-1">

                <#if !realm.registrationEmailAsUsername>
                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username', properties.kcFormGroupErrorClass!)}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" placeholder='${msg("username")}'/>
                    </div>
                </#if>
                
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email', properties.kcFormGroupErrorClass!)}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" placeholder='${msg("email")}'/>
                </div>

                <div id="terms">By signing up, you agree to our Terms of Use & <a>Privacy Policy</a></div>

                <div class="pf-c-button" id="continue-button">Continue</div>
                
                <#if realm.password && social.providers??>
                    <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                        <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                            <#list social.providers as p>
                                <li class="${properties.kcFormSocialAccountListLinkClass!}">
                                    <a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}">
                                        <span>${p.displayName}</span>
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </#if>
            </div>

            <div class="form-inputs" id="step-2">
                <div class="header">
                    <div class="back-button" id="back-button">Back</div>
                    <img src="${url.resourcesPath}/img/magda_logo.svg" class="logo-img"/>
                </div>
                <div class="password-section">
                    <div class="title">Create <i>Password</i></div>
                    <#if passwordRequired??>
                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password', properties.kcFormGroupErrorClass!)}">
                            <input type="password" id="password" class="${properties.kcInputClass!}" name="password" autocomplete="new-password" placeholder='${msg("password")}'/>
                            <div type="button" class="toggle-password" data-target="password">
                                <img class="show-pass" src="${url.resourcesPath}/img/show.svg"/>
                                <img class="hide-pass" src="${url.resourcesPath}/img/hide.svg"/>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm', properties.kcFormGroupErrorClass!)}">
                            <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" placeholder='${msg("passwordConfirm")}'/>
                            <div type="button" class="toggle-password" data-target="password">
                                <img class="show-pass" src="${url.resourcesPath}/img/show.svg"/>
                                <img class="hide-pass" src="${url.resourcesPath}/img/hide.svg"/>
                            </div>     
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value='${msg("registerTitle")}'/>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
        </form>

        <div id="kc-login-link" class="${properties.kcFormGroupClass!}">
            <span>Already have an account? <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))}</a></span>
        </div>
    </#if>
    
    <script src="${url.resourcesPath}/js/form-actions.js"></script>
</@layout.registrationLayout>
