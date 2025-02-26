<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="top-header">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center mx-auto">
            <span class="text-white me-2">
                Faça já download da app <b>CashMe</b>
            </span>
            <a href="/availableSoon" class="download-link">Descarregue Agora!</a>
        </div>
        <div class="language-selector">
            <span>Português</span>
            <span class="dropdown-icon">▼</span>
        </div>
    </div>
</div>

<style>
    .top-header {
        background-color: #E47830; /* Cor laranja */
        color: white;
        font-size: 14px;
        padding: 7px 0;
    }
    .download-link {
        color: white;
        font-weight: bold;
        text-decoration: underline;
        margin-left: 16px; /* Maior espaçamento entre "CashMe" e "Descarregue Agora!" */
    }
    .language-selector {
        display: flex;
        align-items: center;
        cursor: pointer;
    }
    .dropdown-icon {
        margin-left: 5px;
    }
</style>