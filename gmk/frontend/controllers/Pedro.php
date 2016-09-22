<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\DetailView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $model common\models\Partida */

$this->title = "Partida - ".$model->idUser1->username;
$this->title .= $model->idUser2?" vs. ".$model->idUser2->username:" (Aguardando desafiante)";
$this->params['breadcrumbs'][] = ['label' => 'Partidas', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Jogar Partida';

// Insiro os estilos CSS criados para a aplicação feita em javascript
$this->registerCssFile('css/gomoku.css');

// Carrego o javascript do jogo
$this->registerJsFile('js/gmk.js');

if (!$vencedor) {
$this->registerJs('
    setInterval(function() {
        recarregar = document.getElementById("recarregar");
        recarregar.click();
    }, 1000);
');
}

?>

<?php 
Pjax::begin(); 
$u1opacity=$model->vencedor?'1':$model->id_user_1==$jogador_da_vez?'1':'0.3'; 
$u2opacity=$model->vencedor?'1':$model->id_user_2==$jogador_da_vez?'1':'0.3';
?>

<div class="partida-view">

    <h3><?= Html::encode($this->title) ?></h3>

    <!-- ADICIONAR: DetailView contendo os participantes do jogo -->
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
            'attribute'=>'id_user_1',
            'label' => Html::img('@web/img/1.gif',['id'=>'jogador_1','style'=>'width:20px; opacity:'.$u1opacity.';']).'&nbspDesafiado',
            'value' =>  $model->id_user_1==Yii::$app->user->id?
                            "Você (".$model->idUser1->username.")"
                            :$model->idUser1->username,
            ],
            [
            'attribute'=>'id_user_2',
            'label' => Html::img('@web/img/2.gif',['id'=>'jogador_2','style'=>'width:20px; opacity:'.$u2opacity.';']).'&nbspDesafiante',
            'value' =>  $model->idUser2?
                            $model->id_user_2==Yii::$app->user->id?
                                "Você (".$model->idUser2->username.")"
                                :$model->idUser2->username
                        :
                            "Aguardando desafiante",
            ],
            [
            'attribute'=>'vencedor',
            'label' => 'Vencedor',
            'value' =>  $model->idUser2?
                            $model->vencedor?
                                $model->vencedor==Yii::$app->user->id?
                                    "Você (".$model->vencedor0->username.")"
                                    :$model->vencedor0->username
                                :"Partida em andamento"
                            :"Partida não iniciada",
            ]
        ]
        ]);
    ?> 

    <?= Html::a('Recarregar',['partida/view','id'=>$model->id],['id'=>'recarregar','style'=>'display:none']) ?>

    <div class="container">
        <table class="tabuleiro">
        <?php
            for ($row=0; $row<15; $row++) {
                echo "<tr>";
                for ($col=0; $col<15; $col++) {
                    
                    $url = Url::to(['partida/view', 'id'=>$model->id, 'linha'=>$row, 'coluna'=>$col]);
                    if ($vencedor != 0) {
                        if ($jogadas[$row][$col] == $model->id_user_1) {
                            echo "<td><img src='img/1.gif' width=32 /></td>";
                        }
                        else if ($jogadas[$row][$col] == $model->id_user_2) {
                            echo "<td><img src='img/2.gif' width=32 /></td>";
                        }
                        else {
                            echo "<td><img src='img/0.gif' width=32 /></td>";
                        }
                    }
                    else if ($jogador_da_vez == Yii::$app->user->id) {
                        echo "<td id='c_".$row."_".$col."'><a href='".$url."' onClick='Clicked(".$row.",".$col.",".Yii::$app->user->id.")'><img src='img/0.gif' width=32></a></td>";
                    }
                    else {
                        echo "<td id='c_".$row."_".$col."'><img src='img/0.gif' width=32></td>";
                    } 

                    if ($jogadas[$row][$col]!=0) {
                        $this->registerJs("Clicked(".$row.",".$col.",".$jogadas[$row][$col].");");
                    }

                    /*
                    if ($jogador_da_vez == $model->id_user_1) {
                        $this->registerJs('
                                            document.getElementById("jogador_1").style.opacity = 1;
                                            document.getElementById("jogador_2").style.opacity = 0.3;
                                         ');
                    }
                    else {
                            $this->registerJs('
                                                document.getElementById("jogador_2").style.opacity = 1;
                                                document.getElementById("jogador_1").style.opacity = 0.3;
                                             ');
                    } */
                }
                echo "</tr>";
            }
        ?>
        </table>
    </div>

</div>

<span id="jog_1" data-user="<?= $model->id_user_1?>" style="display:none"/>
<span id="jog_2" data-user="<?= $model->id_user_2?>" style="display:none"/>
<span id="vencedor" data-value="<?=$vencedor?>" style="display:none"/>

<?php Pjax::end(); ?>