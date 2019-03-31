<?php

namespace Stopka\MediaFactory\Tests\Model;


use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Nette\DI\Container;
use Stopka\MediaFactory\Model\Database\Entities\BoolFieldEntity;
use Stopka\MediaFactory\Model\Database\Entities\BoolFieldValueEntity;
use Stopka\MediaFactory\Model\Database\Entities\FloatFieldEntity;
use Stopka\MediaFactory\Model\Database\Entities\FloatFieldValueEntity;
use Stopka\MediaFactory\Model\Database\Entities\IntFieldEntity;
use Stopka\MediaFactory\Model\Database\Entities\IntFieldValueEntity;
use Stopka\MediaFactory\Model\Database\Entities\LanguageEntity;
use Stopka\MediaFactory\Model\Database\Entities\MultiSelectFieldEntity;
use Stopka\MediaFactory\Model\Database\Entities\MultiSelectFieldValueEntity;
use Stopka\MediaFactory\Model\Database\Entities\ProductEntity;
use Stopka\MediaFactory\Model\Database\Entities\ProductTypeEntity;
use Stopka\MediaFactory\Model\Database\Entities\SelectOptionEntity;
use Stopka\MediaFactory\Model\Database\Entities\SingleSelectFieldEntity;
use Stopka\MediaFactory\Model\Database\Entities\SingleSelectFieldValueEntity;
use Tester\Assert;

$container = require __DIR__ . '/../bootstrap.php';

/**
 * @testCase
 */
class Test extends \Tester\TestCase
{
    private $container;

    public function __construct(Container $container)
    {
        $this->container = $container;
    }


    public function testAll()
    {
        Assert::noError(function () {

            /** @var EntityManagerInterface $em */
            $em = $this->container->getByType(EntityManagerInterface::class);

            $csLang = new LanguageEntity('Czech', 'cs');
            $em->persist($csLang);
            $em->flush();

            $sizeField = new IntFieldEntity('size', 0);
            $sizeField->getUnits()->setTranslation($csLang, 'palců');
            $sizeField->getTitle()->setTranslation($csLang, 'Rozměr');
            $em->persist($sizeField);
            $em->flush();

            $weightField = new FloatFieldEntity('weight', 0.0);
            $weightField->getUnits()->setTranslation($csLang, 'gramů');
            $weightField->getTitle()->setTranslation($csLang, 'Váha');
            $em->persist($weightField);
            $em->flush();

            $osField = new SingleSelectFieldEntity('os');
            $osField->getTitle()->setTranslation($csLang, 'Operační systém');
            $iosOption = $osField->addOption();
            $iosOption->getTitle()->setTranslation($csLang, 'iOS');
            $option = $osField->addOption();
            $option->getTitle()->setTranslation($csLang, 'Android');
            /** @var SingleSelectFieldValueEntity $val */
            $val = $osField->getDefaultValue();
            $val->selectOption($option);
            $em->persist($osField);
            $em->flush();

            $lteField = new BoolFieldEntity('lte', true);
            $lteField->getTitle()->setTranslation($csLang, 'Podpora LTE');
            $em->persist($lteField);
            $em->flush();

            $ctypeField = new MultiSelectFieldEntity('customer type');
            $ctypeField->getTitle()->setTranslation($csLang, 'Typ zákazníka');
            $studentOption = $ctypeField->addOption();
            $studentOption->getTitle()->setTranslation($csLang, 'Student');
            $firmOption = $ctypeField->addOption();
            $firmOption->getTitle()->setTranslation($csLang, 'Firemní');
            $consumerOption = $ctypeField->addOption();
            $consumerOption->getTitle()->setTranslation($csLang, 'Koncový');
            $em->persist($ctypeField);
            $em->flush();

            $contractField = new BoolFieldEntity('contract only', false);
            $contractField->getTitle()->setTranslation($csLang, 'Pouze se smlouvou');
            $em->persist($contractField);
            $em->flush();

            $deviceType = new ProductTypeEntity('device');
            $deviceType->addField($sizeField);
            $deviceType->addField($weightField);
            $deviceType->addField($osField);
            $deviceType->addField($lteField);
            $em->persist($deviceType);
            $em->flush();

            $postpaidType = new ProductTypeEntity('postpaid tariff');
            $postpaidType->addField($ctypeField);
            $postpaidType->addField($contractField);
            $em->persist($postpaidType);
            $em->flush();

            $iphoneProduct = new ProductEntity('iphone S2', $deviceType);
            /** @var IntFieldValueEntity $val */
            $val = $iphoneProduct->getFieldValue($sizeField);
            $val->setValue(5);
            /** @var FloatFieldValueEntity $val */
            $val = $iphoneProduct->getFieldValue($weightField);
            $val->setValue(150.5);
            /** @var SingleSelectFieldValueEntity $val */
            $val = $iphoneProduct->getFieldValue($osField);
            $val->selectOption($iosOption);
            $em->persist($iphoneProduct);
            $em->flush();

            $tarifProduct = new ProductEntity('student tarif', $deviceType);
            /** @var MultiSelectFieldValueEntity $val */
            $val = $tarifProduct->getFieldValue($ctypeField);
            $val->selectOption($consumerOption);
            $val->selectOption($studentOption);
            $em->persist($tarifProduct);
            $em->flush();


        });
    }

}

(new Test($container))->run();
